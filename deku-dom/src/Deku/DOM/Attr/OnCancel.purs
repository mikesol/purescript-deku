module Deku.DOM.Attr.OnCancel where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Effect as Effect
import Web.Event.Internal.Types as Web.Event.Internal.Types
import Data.Unit as Data.Unit
import Deku.Attribute as Deku.Attribute
import FRP.Event as FRP.Event
import Data.Function (const)

data OnCancel = OnCancel

instance Deku.Attribute.Attr everything OnCancel Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "cancel", value: Deku.Attribute.unset' }

instance
  Deku.Attribute.Attr everything
    OnCancel
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "cancel", value: _ } <<< Deku.Attribute.cb' <<<
    Deku.Attribute.cb

type OnCancelEffect =
  forall element
   . Deku.Attribute.Attr element OnCancel (Effect.Effect Data.Unit.Unit)
  => FRP.Event.Event (Deku.Attribute.Attribute element)

instance Deku.Attribute.Attr everything OnCancel Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "cancel", value: _ } <<< Deku.Attribute.cb'

instance Deku.Attribute.Attr everything OnCancel (Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "cancel", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb
    <<< const
