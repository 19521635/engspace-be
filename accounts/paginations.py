from rest_framework import pagination


class DefaultPagination(pagination.PageNumberPagination):
    page_size = 2
    page_size_query_param = 'page_size'
    page_query_param = 'page'
