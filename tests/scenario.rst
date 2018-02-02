======================
Hello Scenario
======================

Imports::
    >>> from proteus import config, Model, Wizard
    
Create database::

    >>> config = config.set_trytond()
    >>> config.pool.test = True

Install account::

    >>> Module = Model.get('ir.module')
    >>> module, = Module.find([
    ...         ('name', '=', 'hello'),
    ...         ])
    >>> module.click('install')
    >>> Wizard('ir.module.install_upgrade').execute('upgrade')
    >>> print module.name
    goodbye
