(ns reverse-string
  (:require [clojure.string :as str]))

(defn reverse-string [s]
  (->
    s
    str/reverse)
)
