module Deku.DOM.Attr.OnDragenter where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Effect as Effect
import Web.Event.Internal.Types as Web.Event.Internal.Types
import Data.Unit as Data.Unit
import Deku.Attribute as Deku.Attribute
import FRP.Event as FRP.Event
import Data.Function (const)

data OnDragenter = OnDragenter

instance Deku.Attribute.Attr everything OnDragenter Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "ondragenter", value: Deku.Attribute.unset' }

instance
  Deku.Attribute.Attr everything
    OnDragenter
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "ondragenter", value: _ }
    <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb

type OnDragenterEffect =
  forall element
   . Deku.Attribute.Attr element OnDragenter (Effect.Effect Data.Unit.Unit)
  => FRP.Event.Event (Deku.Attribute.Attribute element)

instance Deku.Attribute.Attr everything OnDragenter Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "ondragenter", value: _ } <<<
    Deku.Attribute.cb'

instance Deku.Attribute.Attr everything OnDragenter (Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "ondragenter", value: _ }
    <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb
    <<< const
