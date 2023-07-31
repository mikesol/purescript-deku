module Deku.DOM.Attr.OnAnimationend where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Effect as Effect
import Web.Event.Internal.Types as Web.Event.Internal.Types
import Data.Unit as Data.Unit
import Deku.Attribute as Deku.Attribute
import FRP.Event as FRP.Event
import Data.Function (const)

data OnAnimationend = OnAnimationend

instance Deku.Attribute.Attr everything OnAnimationend Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "onanimationend", value: Deku.Attribute.unset' }

instance
  Deku.Attribute.Attr everything
    OnAnimationend
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onanimationend", value: _ }
    <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb

type OnAnimationendEffect =
  forall element
   . Deku.Attribute.Attr element OnAnimationend (Effect.Effect Data.Unit.Unit)
  => FRP.Event.Event (Deku.Attribute.Attribute element)

instance Deku.Attribute.Attr everything OnAnimationend Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onanimationend", value: _ } <<<
    Deku.Attribute.cb'

instance Deku.Attribute.Attr everything OnAnimationend (Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onanimationend", value: _ }
    <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb
    <<< const
