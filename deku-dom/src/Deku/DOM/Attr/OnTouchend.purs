module Deku.DOM.Attr.OnTouchend where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Effect as Effect
import Web.Event.Internal.Types as Web.Event.Internal.Types
import Data.Unit as Data.Unit
import Deku.Attribute as Deku.Attribute
import FRP.Event as FRP.Event
import Data.Function (const)

data OnTouchend = OnTouchend

instance Deku.Attribute.Attr everything OnTouchend Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "touchend", value: Deku.Attribute.unset' }

instance
  Deku.Attribute.Attr everything
    OnTouchend
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "touchend", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb

type OnTouchendEffect =
  forall element
   . Deku.Attribute.Attr element OnTouchend (Effect.Effect Data.Unit.Unit)
  => FRP.Event.Event (Deku.Attribute.Attribute element)

instance Deku.Attribute.Attr everything OnTouchend Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "touchend", value: _ } <<< Deku.Attribute.cb'

instance Deku.Attribute.Attr everything OnTouchend (Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "touchend", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb
    <<< const
