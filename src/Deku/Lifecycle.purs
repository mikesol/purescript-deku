module Deku.Lifecycle where

import Prelude

import Deku.Core (Domable, envy)
import Effect (Effect)
import FRP.Event (makeEvent)

onWillMount
  :: forall lock payload
   . Effect Unit
  -> Domable lock payload
  -> Domable lock payload
onWillMount e d = envy $ makeEvent \k -> do
  e
  k d
  pure (pure unit)

onDidMount
  :: forall lock payload
   . Effect Unit
  -> Domable lock payload
  -> Domable lock payload
onDidMount e d = envy $ makeEvent \k -> do
  k d
  e
  pure (pure unit)

onDismount
  :: forall lock payload
   . Effect Unit
  -> Domable lock payload
  -> Domable lock payload
onDismount e d = envy $ makeEvent \k -> do
  k d
  pure e