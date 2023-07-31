module Deku.DOM.Attr.OnMouseenter where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Effect as Effect
import Web.Event.Internal.Types as Web.Event.Internal.Types
import Data.Unit as Data.Unit
import Deku.Attribute as Deku.Attribute
import FRP.Event as FRP.Event
import Data.Function (const)

data OnMouseenter = OnMouseenter

instance Deku.Attribute.Attr everything OnMouseenter Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "mouseenter", value: Deku.Attribute.unset' }

instance
  Deku.Attribute.Attr everything
    OnMouseenter
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "mouseenter", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb

type OnMouseenterEffect =
  forall element
   . Deku.Attribute.Attr element OnMouseenter (Effect.Effect Data.Unit.Unit)
  => FRP.Event.Event (Deku.Attribute.Attribute element)

instance Deku.Attribute.Attr everything OnMouseenter Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "mouseenter", value: _ } <<< Deku.Attribute.cb'

instance Deku.Attribute.Attr everything OnMouseenter (Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "mouseenter", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb
    <<< const
