module Deku.Lifecycle where

import Prelude

import Deku.Core (Domable, envy)
import Effect (Effect)
import FRP.Event (makeEvent)

bracket
  :: forall lock payload
   . Effect Unit
  -> Effect Unit
  -> Domable lock payload
  -> Domable lock payload
bracket mount dismount d = envy $ makeEvent \k -> do
  mount
  k d
  pure dismount

onMount
  :: forall lock payload
   . Effect Unit
  -> Domable lock payload
  -> Domable lock payload
onMount e d = envy $ makeEvent \k -> do
  e
  k d
  pure (pure unit)

onDismount
  :: forall lock payload
   . Effect Unit
  -> Domable lock payload
  -> Domable lock payload
onDismount e d = envy $ makeEvent \k -> do
  k d
  pure e