module Deku.DOM.Attr.OnTouchstart where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Effect as Effect
import Web.Event.Internal.Types as Web.Event.Internal.Types
import Data.Unit as Data.Unit
import Deku.Attribute as Deku.Attribute
import FRP.Event as FRP.Event
import Data.Function (const)

data OnTouchstart = OnTouchstart

instance Deku.Attribute.Attr everything OnTouchstart Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "touchstart", value: Deku.Attribute.unset' }

instance
  Deku.Attribute.Attr everything
    OnTouchstart
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "touchstart", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb

type OnTouchstartEffect =
  forall element
   . Deku.Attribute.Attr element OnTouchstart (Effect.Effect Data.Unit.Unit)
  => FRP.Event.Event (Deku.Attribute.Attribute element)

instance Deku.Attribute.Attr everything OnTouchstart Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "touchstart", value: _ } <<< Deku.Attribute.cb'

instance Deku.Attribute.Attr everything OnTouchstart (Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "touchstart", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb
    <<< const
