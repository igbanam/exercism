(ns bird-watcher)

(def last-week [0 2 5 3 7 8 4])

(defn today [birds] (last birds))

(defn inc-bird [birds] (assoc birds 6 (inc (last birds))))

(defn day-without-birds?
  [birds] (not (every? pos-int? birds)))

(defn n-days-count
  [birds n] (reduce + (take n birds)))

(defn busy-days
  [birds] (count (filter (fn [x] (> x 4)) birds)))

(defn alternating-first-6?
  [birds] (every?
            (fn
              [x] (or
                    (and (= 1 (first x)) (= 0 (last x)))
                    (and (= 0 (first x)) (= 1 (last x)))))
            (partition 2 (take 6 birds))))

(defn odd-week?
  [birds] (and
            (= (first birds) (last birds))
            (alternating-first-6? birds)))
