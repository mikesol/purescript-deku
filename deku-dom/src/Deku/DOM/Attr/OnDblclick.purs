module Deku.DOM.Attr.OnDblclick where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Effect as Effect
import Web.Event.Internal.Types as Web.Event.Internal.Types
import Data.Unit as Data.Unit
import Deku.Attribute as Deku.Attribute
import FRP.Event as FRP.Event
import Data.Function (const)

data OnDblclick = OnDblclick

instance Deku.Attribute.Attr everything OnDblclick Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "ondblclick", value: Deku.Attribute.unset' }

instance
  Deku.Attribute.Attr everything
    OnDblclick
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "ondblclick", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb

type OnDblclickEffect =
  forall element
   . Deku.Attribute.Attr element OnDblclick (Effect.Effect Data.Unit.Unit)
  => FRP.Event.Event (Deku.Attribute.Attribute element)

instance Deku.Attribute.Attr everything OnDblclick Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "ondblclick", value: _ } <<< Deku.Attribute.cb'

instance Deku.Attribute.Attr everything OnDblclick (Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "ondblclick", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb
    <<< const