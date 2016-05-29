;;;; taxi-positions.asd
(defsystem :taxi-positions
  :author "<papachan@gmail.com>"
  :license "MIT"
  :depends-on (:hunchentoot
               :cl-who)
  :components ((:module "src"
                :serial t
                :components
                ((:file "package")
                 (:file "server")
                 (:file "positions"))))
  :description "")

