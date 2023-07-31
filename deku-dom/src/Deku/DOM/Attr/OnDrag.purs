module Deku.DOM.Attr.OnDrag where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Effect as Effect
import Web.Event.Internal.Types as Web.Event.Internal.Types
import Data.Unit as Data.Unit
import Deku.Attribute as Deku.Attribute
import FRP.Event as FRP.Event
import Data.Function (const)

data OnDrag = OnDrag

instance Deku.Attribute.Attr everything OnDrag Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "ondrag", value: Deku.Attribute.unset' }

instance
  Deku.Attribute.Attr everything
    OnDrag
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "ondrag", value: _ } <<< Deku.Attribute.cb' <<<
    Deku.Attribute.cb

type OnDragEffect =
  forall element
   . Deku.Attribute.Attr element OnDrag (Effect.Effect Data.Unit.Unit)
  => FRP.Event.Event (Deku.Attribute.Attribute element)

instance Deku.Attribute.Attr everything OnDrag Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "ondrag", value: _ } <<< Deku.Attribute.cb'

instance Deku.Attribute.Attr everything OnDrag (Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "ondrag", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb
    <<< const
