module Deku.DOM.Attr.OnCut where

import Control.Semigroupoid ((<<<))
import Effect as Effect
import Web.Event.Internal.Types as Web.Event.Internal.Types
import Data.Unit as Data.Unit
import Deku.Attribute as Deku.Attribute
import FRP.Event as FRP.Event

data OnCut = OnCut

instance Deku.Attribute.Attr everything OnCut Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "onCut", value: Deku.Attribute.unset' }

instance
  Deku.Attribute.Attr everything
    OnCut
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onCut", value: _ } <<< Deku.Attribute.cb' <<<
    Deku.Attribute.cb

type OnCutEffect =
  forall element
   . Deku.Attribute.Attr element OnCut (Effect.Effect Data.Unit.Unit)
  => FRP.Event.Event (Deku.Attribute.Attribute element)

instance Deku.Attribute.Attr everything OnCut Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onCut", value: _ } <<< Deku.Attribute.cb'
