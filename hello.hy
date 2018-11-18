(import [trytond.model [ModelSQL ModelView fields]])

(defclass Hello [ModelSQL ModelView]
  "Hello World"
  [--name-- "hello"
   name (.Char fields "Name" :required True)
   greeting (.Function fields (.Char fields "Greeting") "get_greeting")]

  (defn get-greeting [self name]
    (.format "Hello {}" self.name)))
