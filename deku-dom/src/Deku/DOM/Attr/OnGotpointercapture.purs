module Deku.DOM.Attr.OnGotpointercapture where

import Control.Semigroupoid ((<<<))
import Effect as Effect
import Web.Event.Internal.Types as Web.Event.Internal.Types
import Data.Unit as Data.Unit
import Deku.Attribute as Deku.Attribute
import FRP.Event as FRP.Event
import Data.Function (const)

data OnGotpointercapture = OnGotpointercapture

instance Deku.Attribute.Attr everything OnGotpointercapture Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute
    { key: "ongotpointercapture", value: Deku.Attribute.unset' }

instance
  Deku.Attribute.Attr everything
    OnGotpointercapture
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "ongotpointercapture", value: _ }
    <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb

type OnGotpointercaptureEffect =
  forall element
   . Deku.Attribute.Attr element OnGotpointercapture (Effect.Effect Data.Unit.Unit)
  => FRP.Event.Event (Deku.Attribute.Attribute element)

instance Deku.Attribute.Attr everything OnGotpointercapture Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "ongotpointercapture", value: _ } <<<
    Deku.Attribute.cb'

instance Deku.Attribute.Attr everything OnGotpointercapture (Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "ongotpointercapture", value: _ }
    <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb
    <<< const
