module Deku.DOM.Attr.OnTouchmove where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Effect as Effect
import Web.Event.Internal.Types as Web.Event.Internal.Types
import Data.Unit as Data.Unit
import Deku.Attribute as Deku.Attribute
import FRP.Event as FRP.Event
import Data.Function (const)

data OnTouchmove = OnTouchmove

instance Deku.Attribute.Attr everything OnTouchmove Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "touchmove", value: Deku.Attribute.unset' }

instance
  Deku.Attribute.Attr everything
    OnTouchmove
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "touchmove", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb

type OnTouchmoveEffect =
  forall element
   . Deku.Attribute.Attr element OnTouchmove (Effect.Effect Data.Unit.Unit)
  => FRP.Event.Event (Deku.Attribute.Attribute element)

instance Deku.Attribute.Attr everything OnTouchmove Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "touchmove", value: _ } <<< Deku.Attribute.cb'

instance Deku.Attribute.Attr everything OnTouchmove (Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "touchmove", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb
    <<< const
