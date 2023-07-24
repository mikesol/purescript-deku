module Deku.DOM.Attr.Onbegin where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Effect as Effect
import Web.Event.Internal.Types as Web.Event.Internal.Types
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.Animate (Animate_)
import Deku.DOM.Elt.AnimateMotion (AnimateMotion_)
import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.DOM.Elt.Discard (Discard_)
import Deku.DOM.Elt.Set (Set_)
import FRP.Event as FRP.Event

data Onbegin = Onbegin

instance Deku.Attribute.Attr everything Onbegin Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "onbegin", value: Deku.Attribute.unset' }

type OnbeginEffect =
  forall element
   . Deku.Attribute.Attr element Onbegin (Effect.Effect Data.Unit.Unit)
  => FRP.Event.Event (Deku.Attribute.Attribute element)

instance
  Deku.Attribute.Attr Animate_
    Onbegin
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onbegin", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb

instance Deku.Attribute.Attr Animate_ Onbegin Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onbegin", value: _ } <<< Deku.Attribute.cb'

instance
  Deku.Attribute.Attr AnimateMotion_
    Onbegin
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onbegin", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb

instance Deku.Attribute.Attr AnimateMotion_ Onbegin Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onbegin", value: _ } <<< Deku.Attribute.cb'

instance
  Deku.Attribute.Attr AnimateTransform_
    Onbegin
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onbegin", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb

instance Deku.Attribute.Attr AnimateTransform_ Onbegin Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onbegin", value: _ } <<< Deku.Attribute.cb'

instance
  Deku.Attribute.Attr Discard_
    Onbegin
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onbegin", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb

instance Deku.Attribute.Attr Discard_ Onbegin Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onbegin", value: _ } <<< Deku.Attribute.cb'

instance
  Deku.Attribute.Attr Set_ Onbegin (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onbegin", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb

instance Deku.Attribute.Attr Set_ Onbegin Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onbegin", value: _ } <<< Deku.Attribute.cb'
