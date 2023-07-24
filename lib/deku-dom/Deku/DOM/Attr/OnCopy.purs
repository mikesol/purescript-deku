module Deku.DOM.Attr.OnCopy where

import Control.Semigroupoid ((<<<))
import Effect as Effect
import Web.Event.Internal.Types as Web.Event.Internal.Types
import Data.Unit as Data.Unit
import Deku.Attribute as Deku.Attribute
import FRP.Event as FRP.Event

data OnCopy = OnCopy

instance Deku.Attribute.Attr everything OnCopy Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "onCopy", value: Deku.Attribute.unset' }

instance
  Deku.Attribute.Attr everything
    OnCopy
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onCopy", value: _ } <<< Deku.Attribute.cb' <<<
    Deku.Attribute.cb

type OnCopyEffect =
  forall element
   . Deku.Attribute.Attr element OnCopy (Effect.Effect Data.Unit.Unit)
  => FRP.Event.Event (Deku.Attribute.Attribute element)

instance Deku.Attribute.Attr everything OnCopy Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onCopy", value: _ } <<< Deku.Attribute.cb'
