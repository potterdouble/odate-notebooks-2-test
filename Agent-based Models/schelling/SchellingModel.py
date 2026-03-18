import random

from mesa import Model, Agent
from mesa.space import SingleGrid
from mesa.datacollection import DataCollector


class SchellingAgent(Agent):
    '''
    Schelling segregation agent
    '''
    def __init__(self, model, agent_type):
        '''
         Create a new Schelling agent.

         Args:
            model: The model instance.
            agent_type: Indicator for the agent's type (minority=1, majority=0)
        '''
        super().__init__(model)
        self.type = agent_type

    def step(self):
        similar = 0
        for neighbor in self.model.grid.iter_neighbors(self.pos, moore=True):
            if neighbor.type == self.type:
                similar += 1

        # If unhappy, move:
        if similar < self.model.homophily:
            self.model.grid.move_to_empty(self)
        else:
            self.model.happy += 1


class Schelling(Model):
    '''
    Model class for the Schelling segregation model.
    '''

    def __init__(self, height=20, width=20, density=0.8, minority_pc=0.2, homophily=3, seed=None, **kwargs):
        '''
        '''
        super().__init__(seed=seed)

        self.height = height
        self.width = width
        self.density = density
        self.minority_pc = minority_pc
        self.homophily = homophily

        self.grid = SingleGrid(height, width, torus=True)

        self.happy = 0
        self.datacollector = DataCollector(
            {"happy": "happy",  # Model-level count of happy agents
             "Segregated_Agents": self.get_segregation},
            # For testing purposes, agent's individual x and y
            {"x": lambda a: a.pos[0], "y": lambda a: a.pos[1]})

        # Set up agents
        # We use a grid iterator that returns
        # the coordinates of a cell as well as
        # its contents. (coord_iter)
        for content, (x, y) in self.grid.coord_iter():
            if random.random() < self.density:
                if random.random() < self.minority_pc:
                    agent_type = 1
                else:
                    agent_type = 0

                agent = SchellingAgent(self, agent_type)
                self.grid.place_agent(agent, (x, y))

        self.running = True
        self.datacollector.collect(self)

    def step(self):
        '''
        Run one step of the model. If All agents are happy, halt the model.
        '''
        self.happy = 0  # Reset counter of happy agents
        self.agents.shuffle_do("step")
        # collect data
        self.datacollector.collect(self)

        if self.happy == len(self.agents):
            self.running = False

    def get_segregation(self):
        '''
        Find the % of agents that only have neighbors of their same type.
        '''
        segregated_agents = 0
        for agent in self.agents:
            segregated = True
            for neighbor in self.grid.iter_neighbors(agent.pos, moore=True):
                if neighbor.type != agent.type:
                    segregated = False
                    break
            if segregated:
                segregated_agents += 1
        return segregated_agents / len(self.agents)
