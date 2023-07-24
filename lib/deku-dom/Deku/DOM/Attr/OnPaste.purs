module Deku.DOM.Attr.OnPaste where

import Control.Semigroupoid ((<<<))
import Effect as Effect
import Web.Event.Internal.Types as Web.Event.Internal.Types
import Data.Unit as Data.Unit
import Deku.Attribute as Deku.Attribute
import FRP.Event as FRP.Event

data OnPaste = OnPaste

instance Deku.Attribute.Attr everything OnPaste Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "onPaste", value: Deku.Attribute.unset' }

instance
  Deku.Attribute.Attr everything
    OnPaste
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onPaste", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb

type OnPasteEffect =
  forall element
   . Deku.Attribute.Attr element OnPaste (Effect.Effect Data.Unit.Unit)
  => FRP.Event.Event (Deku.Attribute.Attribute element)

instance Deku.Attribute.Attr everything OnPaste Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onPaste", value: _ } <<< Deku.Attribute.cb'
