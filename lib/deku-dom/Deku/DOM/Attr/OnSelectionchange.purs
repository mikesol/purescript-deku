module Deku.DOM.Attr.OnSelectionchange where

import Control.Semigroupoid ((<<<))
import Effect as Effect
import Web.Event.Internal.Types as Web.Event.Internal.Types
import Data.Unit as Data.Unit
import Deku.Attribute as Deku.Attribute
import FRP.Event as FRP.Event

data OnSelectionchange = OnSelectionchange

instance Deku.Attribute.Attr everything OnSelectionchange Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute
    { key: "onSelectionchange", value: Deku.Attribute.unset' }

instance
  Deku.Attribute.Attr everything
    OnSelectionchange
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onSelectionchange", value: _ }
    <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb

type OnSelectionchangeEffect =
  forall element
   . Deku.Attribute.Attr element OnSelectionchange (Effect.Effect Data.Unit.Unit)
  => FRP.Event.Event (Deku.Attribute.Attribute element)

instance Deku.Attribute.Attr everything OnSelectionchange Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onSelectionchange", value: _ } <<<
    Deku.Attribute.cb'
