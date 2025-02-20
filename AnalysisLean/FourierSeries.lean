import Mathlib.Topology.MetricSpace.Basic
import Mathlib.Data.Real.Basic
import Mathlib.Data.Complex.Exponential
import Mathlib.Analysis.InnerProductSpace.Basic
import Mathlib.MeasureTheory.Integral.IntervalIntegral

open Complex Set Metric Function Finset
open scoped Real

noncomputable def fourier_coeff (f : ℝ → ℂ) (k : ℤ) : ℂ :=
  (∫ x in (0 : ℝ)..1, f x * exp (-2 * π * Complex.I * k * x))

noncomputable def partial_fourier_sum (f : ℝ → ℂ) (N : ℕ) : ℝ → ℂ :=
  fun x => ∑ k in Finset.range (2 * N + 1),
    fourier_coeff f k * Complex.exp (2 * π * Complex.I * k * x)

-- T 5.4.1
theorem special_stone_weierstrass_approx
  {f : ℝ → ℂ} (hf : Continuous f) {ε : ℝ} (hε : ε > 0) :
  ∃ P : ℝ → ℂ, (∃ N : ℕ, ∀ x, P x = partial_fourier_sum f N x) ∧
    ∀ x, Complex.abs (f x - P x) ≤ ε :=
  sorry
