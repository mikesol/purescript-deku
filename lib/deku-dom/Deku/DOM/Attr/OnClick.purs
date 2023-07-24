module Deku.DOM.Attr.OnClick where

import Control.Semigroupoid ((<<<))
import Effect as Effect
import Web.Event.Internal.Types as Web.Event.Internal.Types
import Data.Unit as Data.Unit
import Deku.Attribute as Deku.Attribute
import FRP.Event as FRP.Event

data OnClick = OnClick

instance Deku.Attribute.Attr everything OnClick Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "onClick", value: Deku.Attribute.unset' }

instance
  Deku.Attribute.Attr everything
    OnClick
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onClick", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb

type OnClickEffect =
  forall element
   . Deku.Attribute.Attr element OnClick (Effect.Effect Data.Unit.Unit)
  => FRP.Event.Event (Deku.Attribute.Attribute element)

instance Deku.Attribute.Attr everything OnClick Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onClick", value: _ } <<< Deku.Attribute.cb'
