module Deku.DOM.Attr.OnEmptied where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Effect as Effect
import Web.Event.Internal.Types as Web.Event.Internal.Types
import Data.Unit as Data.Unit
import Deku.Attribute as Deku.Attribute
import FRP.Event as FRP.Event
import Data.Function (const)

data OnEmptied = OnEmptied

instance Deku.Attribute.Attr everything OnEmptied Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "emptied", value: Deku.Attribute.unset' }

instance
  Deku.Attribute.Attr everything
    OnEmptied
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "emptied", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb

type OnEmptiedEffect =
  forall element
   . Deku.Attribute.Attr element OnEmptied (Effect.Effect Data.Unit.Unit)
  => FRP.Event.Event (Deku.Attribute.Attribute element)

instance Deku.Attribute.Attr everything OnEmptied Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "emptied", value: _ } <<< Deku.Attribute.cb'

instance Deku.Attribute.Attr everything OnEmptied (Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "emptied", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb
    <<< const
