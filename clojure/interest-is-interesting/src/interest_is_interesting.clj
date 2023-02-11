(ns interest-is-interesting)

(defn interest-rate
  "Calculate interest rate per condition"
  [balance] (cond
              (< balance 0M) -3.213
              (< balance 1000M) 0.5
              (< balance 5000M) 1.621
              :else 2.475))

(defn annual-balance-update
  "Annual Balance Update"
  [balance] (+ balance
               (* balance
                  1/100
                  (bigdec (abs (interest-rate balance))))))

(defn amount-to-donate
  "Amount to Donate"
  [balance tax-free-percentage]
  (if (< balance 0)
    0
    (int (* balance 1/100 (* 2M tax-free-percentage)))))
