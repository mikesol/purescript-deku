module Deku.DOM.Attr.OnFocus where

import Control.Semigroupoid ((<<<))
import Effect as Effect
import Web.Event.Internal.Types as Web.Event.Internal.Types
import Data.Unit as Data.Unit
import Deku.Attribute as Deku.Attribute
import FRP.Event as FRP.Event

data OnFocus = OnFocus

instance Deku.Attribute.Attr everything OnFocus Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "onFocus", value: Deku.Attribute.unset' }

instance
  Deku.Attribute.Attr everything
    OnFocus
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onFocus", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb

type OnFocusEffect =
  forall element
   . Deku.Attribute.Attr element OnFocus (Effect.Effect Data.Unit.Unit)
  => FRP.Event.Event (Deku.Attribute.Attribute element)

instance Deku.Attribute.Attr everything OnFocus Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onFocus", value: _ } <<< Deku.Attribute.cb'
