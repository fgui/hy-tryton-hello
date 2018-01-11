
try:
    from trytond.modules.country.tests.test_hello import suite
except ImportError:
    from .test_hello import suite

__all__ = ['suite']
