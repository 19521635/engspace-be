from rest_framework import pagination


class DefaultPagination(pagination.PageNumberPagination):
    page_size = 20
    page_size_query_param = 'page_size'
    page_query_param = 'page'
    last_page_strings = ('last',)
