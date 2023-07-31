module Deku.DOM.Attr.OnDrop where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Effect as Effect
import Web.Event.Internal.Types as Web.Event.Internal.Types
import Data.Unit as Data.Unit
import Deku.Attribute as Deku.Attribute
import FRP.Event as FRP.Event
import Data.Function (const)

data OnDrop = OnDrop

instance Deku.Attribute.Attr everything OnDrop Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "ondrop", value: Deku.Attribute.unset' }

instance
  Deku.Attribute.Attr everything
    OnDrop
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "ondrop", value: _ } <<< Deku.Attribute.cb' <<<
    Deku.Attribute.cb

type OnDropEffect =
  forall element
   . Deku.Attribute.Attr element OnDrop (Effect.Effect Data.Unit.Unit)
  => FRP.Event.Event (Deku.Attribute.Attribute element)

instance Deku.Attribute.Attr everything OnDrop Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "ondrop", value: _ } <<< Deku.Attribute.cb'

instance Deku.Attribute.Attr everything OnDrop (Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "ondrop", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb
    <<< const
