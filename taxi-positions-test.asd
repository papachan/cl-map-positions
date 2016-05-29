(defsystem :taxi-positions-test
  :author "@papachan <papachan@gmail.com>"
  :license "MIT"
  :depends-on (:taxi-positions
               :fiveam)
  :components ((:module "t"
                :serial t
                :components
                ((:file "package-test")
                 (:file "positions-test"))))
  :description "")
