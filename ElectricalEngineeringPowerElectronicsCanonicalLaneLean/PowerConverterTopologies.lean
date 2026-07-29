import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringPowerElectronicsCanonicalLaneLean

structure PowerConverterTopology where
  topologyName : String
  switchingFrequency : Nat
  inputVoltageRange : (Float × Float)
  outputVoltageRange : (Float × Float)
  efficiency : Float

structure PowerConverterTopologyEvidence (T : PowerConverterTopology) where
  topologyNameClosed : T.topologyName ≠ ""
  switchingFrequencyClosed : T.switchingFrequency > 0
  inputVoltageRangeClosed : T.inputVoltageRange.1 < T.inputVoltageRange.2
  outputVoltageRangeClosed : T.outputVoltageRange.1 < T.outputVoltageRange.2
  efficiencyClosed : T.efficiency > 0.0 ∧ T.efficiency < 1.0

def PowerConverterTopologyClosed (T : PowerConverterTopology) : Prop :=
  T.topologyName ≠ "" ∧ T.switchingFrequency > 0 ∧
  T.inputVoltageRange.1 < T.inputVoltageRange.2 ∧
  T.outputVoltageRange.1 < T.outputVoltageRange.2 ∧
  T.efficiency > 0.0 ∧ T.efficiency < 1.0

theorem power_converter_topology_closed_from_evidence
    (T : PowerConverterTopology) (E : PowerConverterTopologyEvidence T) :
    PowerConverterTopologyClosed T := by
  exact And.intro E.topologyNameClosed
    (And.intro E.switchingFrequencyClosed
      (And.intro E.inputVoltageRangeClosed
        (And.intro E.outputVoltageRangeClosed
          (And.intro E.efficiencyClosed.1 E.efficiencyClosed.2))))

end ElectricalEngineeringPowerElectronicsCanonicalLaneLean
end HautevilleHouse