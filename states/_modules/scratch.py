import logging
try:
    import requests
    HAS_REQUESTS = True
except ImportError:
    HAS_REQUESTS = False

log = logging.getLogger(__name__)

__virtualname__ = 'scratch'


def __virtual__():
    '''
    Some silly functionality
    '''
    if HAS_REQUESTS:
        return __virtualname__
    else:
        return False, 'Some null pointer shit going on'


def get_info():

    data = __salt__["pillar.items"]()

    return data