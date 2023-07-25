module Deku.DOM.Attr.OnAnimationiteration where

import Control.Semigroupoid ((<<<))
import Effect as Effect
import Web.Event.Internal.Types as Web.Event.Internal.Types
import Data.Unit as Data.Unit
import Deku.Attribute as Deku.Attribute
import FRP.Event as FRP.Event
import Data.Function (const)

data OnAnimationiteration = OnAnimationiteration

instance Deku.Attribute.Attr everything OnAnimationiteration Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute
    { key: "onanimationiteration", value: Deku.Attribute.unset' }

instance
  Deku.Attribute.Attr everything
    OnAnimationiteration
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onanimationiteration", value: _ }
    <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb

type OnAnimationiterationEffect =
  forall element
   . Deku.Attribute.Attr element OnAnimationiteration (Effect.Effect Data.Unit.Unit)
  => FRP.Event.Event (Deku.Attribute.Attribute element)

instance Deku.Attribute.Attr everything OnAnimationiteration Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onanimationiteration", value: _ } <<<
    Deku.Attribute.cb'

instance Deku.Attribute.Attr everything OnAnimationiteration (Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onanimationiteration", value: _ }
    <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb
    <<< const
