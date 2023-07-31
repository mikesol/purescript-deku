module Deku.DOM.Attr.OnClose where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Effect as Effect
import Web.Event.Internal.Types as Web.Event.Internal.Types
import Data.Unit as Data.Unit
import Deku.Attribute as Deku.Attribute
import FRP.Event as FRP.Event
import Data.Function (const)

data OnClose = OnClose

instance Deku.Attribute.Attr everything OnClose Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "close", value: Deku.Attribute.unset' }

instance
  Deku.Attribute.Attr everything
    OnClose
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "close", value: _ } <<< Deku.Attribute.cb' <<<
    Deku.Attribute.cb

type OnCloseEffect =
  forall element
   . Deku.Attribute.Attr element OnClose (Effect.Effect Data.Unit.Unit)
  => FRP.Event.Event (Deku.Attribute.Attribute element)

instance Deku.Attribute.Attr everything OnClose Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "close", value: _ } <<< Deku.Attribute.cb'

instance Deku.Attribute.Attr everything OnClose (Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "close", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb
    <<< const
