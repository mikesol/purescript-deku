module Deku.DOM.Attr.OnPointerover where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Effect as Effect
import Web.Event.Internal.Types as Web.Event.Internal.Types
import Data.Unit as Data.Unit
import Deku.Attribute as Deku.Attribute
import FRP.Event as FRP.Event
import Data.Function (const)

data OnPointerover = OnPointerover

instance Deku.Attribute.Attr everything OnPointerover Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "onpointerover", value: Deku.Attribute.unset' }

instance
  Deku.Attribute.Attr everything
    OnPointerover
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onpointerover", value: _ }
    <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb

type OnPointeroverEffect =
  forall element
   . Deku.Attribute.Attr element OnPointerover (Effect.Effect Data.Unit.Unit)
  => FRP.Event.Event (Deku.Attribute.Attribute element)

instance Deku.Attribute.Attr everything OnPointerover Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onpointerover", value: _ } <<<
    Deku.Attribute.cb'

instance Deku.Attribute.Attr everything OnPointerover (Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onpointerover", value: _ }
    <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb
    <<< const
