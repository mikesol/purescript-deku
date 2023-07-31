module Deku.DOM.Attr.OnLostpointercapture where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Effect as Effect
import Web.Event.Internal.Types as Web.Event.Internal.Types
import Data.Unit as Data.Unit
import Deku.Attribute as Deku.Attribute
import FRP.Event as FRP.Event
import Data.Function (const)

data OnLostpointercapture = OnLostpointercapture

instance Deku.Attribute.Attr everything OnLostpointercapture Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute
    { key: "lostpointercapture", value: Deku.Attribute.unset' }

instance
  Deku.Attribute.Attr everything
    OnLostpointercapture
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "lostpointercapture", value: _ }
    <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb

type OnLostpointercaptureEffect =
  forall element
   . Deku.Attribute.Attr element OnLostpointercapture (Effect.Effect Data.Unit.Unit)
  => FRP.Event.Event (Deku.Attribute.Attribute element)

instance Deku.Attribute.Attr everything OnLostpointercapture Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "lostpointercapture", value: _ } <<<
    Deku.Attribute.cb'

instance Deku.Attribute.Attr everything OnLostpointercapture (Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "lostpointercapture", value: _ }
    <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb
    <<< const
