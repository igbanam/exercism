(ns sublist)

(defn in? "https://stackoverflow.com/a/21538308/393021"
      [a b]
      (some #{a} (partition (count a) 1 b)))

(defn classify [list1 list2] ;; <- arglist goes here
      (cond
            (= list1 list2)   :equal
            (in? list1 list2) :sublist
            (in? list2 list1) :superlist
            :else :unequal
      )
)
