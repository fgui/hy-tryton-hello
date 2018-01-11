(import [unittest]
        [trytond.tests.test_tryton]
        [trytond.tests.test_tryton [ModuleTestCase with_transaction]]
        [trytond.pool [Pool]])


(defclass HelloTestCase [ModuleTestCase]
  "Test Hello Module"
  [module "hello"]

  (with-decorator (with_transaction)
    (defn test-greeting [self]
      "Test Greeting"
      (setv pool (Pool)
            Hello (.get pool "hello")
            hello1 (Hello)
            hello1.name "test")
      (.save hello1)
      (.assertEquals self hello1.greeting "Hello test"))))



(defn suite []
  (setv suite (.suite trytond.tests.test_tryton))
  (.addTests suite
             (.loadTestsFromTestCase
               (.TestLoader unittest) HelloTestCase))
  suite)
