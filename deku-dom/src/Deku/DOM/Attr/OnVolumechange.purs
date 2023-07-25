module Deku.DOM.Attr.OnVolumechange where

import Control.Semigroupoid ((<<<))
import Effect as Effect
import Web.Event.Internal.Types as Web.Event.Internal.Types
import Data.Unit as Data.Unit
import Deku.Attribute as Deku.Attribute
import FRP.Event as FRP.Event
import Data.Function (const)

data OnVolumechange = OnVolumechange

instance Deku.Attribute.Attr everything OnVolumechange Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "onvolumechange", value: Deku.Attribute.unset' }

instance
  Deku.Attribute.Attr everything
    OnVolumechange
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onvolumechange", value: _ }
    <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb

type OnVolumechangeEffect =
  forall element
   . Deku.Attribute.Attr element OnVolumechange (Effect.Effect Data.Unit.Unit)
  => FRP.Event.Event (Deku.Attribute.Attribute element)

instance Deku.Attribute.Attr everything OnVolumechange Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onvolumechange", value: _ } <<<
    Deku.Attribute.cb'

instance Deku.Attribute.Attr everything OnVolumechange (Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onvolumechange", value: _ }
    <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb
    <<< const
