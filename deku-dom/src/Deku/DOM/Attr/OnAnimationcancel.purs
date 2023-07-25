module Deku.DOM.Attr.OnAnimationcancel where

import Control.Semigroupoid ((<<<))
import Effect as Effect
import Web.Event.Internal.Types as Web.Event.Internal.Types
import Data.Unit as Data.Unit
import Deku.Attribute as Deku.Attribute
import FRP.Event as FRP.Event
import Data.Function (const)

data OnAnimationcancel = OnAnimationcancel

instance Deku.Attribute.Attr everything OnAnimationcancel Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute
    { key: "onanimationcancel", value: Deku.Attribute.unset' }

instance
  Deku.Attribute.Attr everything
    OnAnimationcancel
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onanimationcancel", value: _ }
    <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb

type OnAnimationcancelEffect =
  forall element
   . Deku.Attribute.Attr element OnAnimationcancel (Effect.Effect Data.Unit.Unit)
  => FRP.Event.Event (Deku.Attribute.Attribute element)

instance Deku.Attribute.Attr everything OnAnimationcancel Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onanimationcancel", value: _ } <<<
    Deku.Attribute.cb'

instance Deku.Attribute.Attr everything OnAnimationcancel (Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onanimationcancel", value: _ }
    <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb
    <<< const
