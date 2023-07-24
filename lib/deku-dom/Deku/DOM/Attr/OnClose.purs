module Deku.DOM.Attr.OnClose where

import Control.Semigroupoid ((<<<))
import Effect as Effect
import Web.Event.Internal.Types as Web.Event.Internal.Types
import Data.Unit as Data.Unit
import Deku.Attribute as Deku.Attribute
import FRP.Event as FRP.Event

data OnClose = OnClose

instance Deku.Attribute.Attr everything OnClose Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "onClose", value: Deku.Attribute.unset' }

instance
  Deku.Attribute.Attr everything
    OnClose
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onClose", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb

type OnCloseEffect =
  forall element
   . Deku.Attribute.Attr element OnClose (Effect.Effect Data.Unit.Unit)
  => FRP.Event.Event (Deku.Attribute.Attribute element)

instance Deku.Attribute.Attr everything OnClose Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onClose", value: _ } <<< Deku.Attribute.cb'
