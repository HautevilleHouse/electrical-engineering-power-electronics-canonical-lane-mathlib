import HautevilleHouse.ElectricalEngineeringPowerElectronicsCanonicalLaneLean.TheoremStatement
import CanonicalLaneMathlibCore
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace ElectricalEngineeringPowerElectronicsCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure PowerElectronicsSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure PowerElectronicsAdmittedObject where
  space : PowerElectronicsSpace
  powerConverterTopology : Prop
  switchingLossBound : Prop
  controlStability : Prop
  conclusion : powerConverterTopology ∧ switchingLossBound ∧ controlStability

structure PowerElectronicsEndgameState where
  object : PowerElectronicsAdmittedObject

def PowerElectronicsWitnessClosed (O : PowerElectronicsAdmittedObject) : Prop :=
  O.powerConverterTopology ∧ O.switchingLossBound ∧ O.controlStability

end ElectricalEngineeringPowerElectronicsCanonicalLaneLean
end HautevilleHouse