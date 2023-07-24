module Deku.DOM.Attr.OnInput where

import Control.Semigroupoid ((<<<))
import Effect as Effect
import Web.Event.Internal.Types as Web.Event.Internal.Types
import Data.Unit as Data.Unit
import Deku.Attribute as Deku.Attribute
import FRP.Event as FRP.Event

data OnInput = OnInput

instance Deku.Attribute.Attr everything OnInput Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "onInput", value: Deku.Attribute.unset' }

instance
  Deku.Attribute.Attr everything
    OnInput
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onInput", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb

type OnInputEffect =
  forall element
   . Deku.Attribute.Attr element OnInput (Effect.Effect Data.Unit.Unit)
  => FRP.Event.Event (Deku.Attribute.Attribute element)

instance Deku.Attribute.Attr everything OnInput Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onInput", value: _ } <<< Deku.Attribute.cb'
