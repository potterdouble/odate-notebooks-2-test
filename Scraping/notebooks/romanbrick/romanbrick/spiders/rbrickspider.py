import scrapy


class RbrickspiderSpider(scrapy.Spider):
    name = "rbrickspider"
    allowed_domains = ["finds.org.uk"]
    start_urls = ["https://finds.org.uk/database/search/results/q/stamped+brick"]

    def parse(self, response):
        pass

    def parse(self, response):
        with open("test.html", 'wb') as file:
            file.write(response.body)