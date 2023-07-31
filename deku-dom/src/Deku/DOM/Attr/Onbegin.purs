module Deku.DOM.Attr.OnBegin where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Effect as Effect
import Web.Event.Internal.Types as Web.Event.Internal.Types
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.Animate (Animate_)
import Deku.DOM.Elt.AnimateMotion (AnimateMotion_)
import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.DOM.Elt.Discard (Discard_)
import Deku.DOM.Elt.Set (Set_)
import FRP.Event as FRP.Event
import Data.Function (const)

data OnBegin = OnBegin

instance Deku.Attribute.Attr everything OnBegin Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "onbegin", value: Deku.Attribute.unset' }

type OnBeginEffect =
  forall element
   . Deku.Attribute.Attr element OnBegin (Effect.Effect Data.Unit.Unit)
  => FRP.Event.Event (Deku.Attribute.Attribute element)

instance
  Deku.Attribute.Attr Animate_
    OnBegin
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onbegin", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb

instance Deku.Attribute.Attr Animate_ OnBegin Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onbegin", value: _ } <<< Deku.Attribute.cb'

instance Deku.Attribute.Attr Animate_ OnBegin (Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onbegin", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb
    <<< const

instance
  Deku.Attribute.Attr AnimateMotion_
    OnBegin
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onbegin", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb

instance Deku.Attribute.Attr AnimateMotion_ OnBegin Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onbegin", value: _ } <<< Deku.Attribute.cb'

instance Deku.Attribute.Attr AnimateMotion_ OnBegin (Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onbegin", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb
    <<< const

instance
  Deku.Attribute.Attr AnimateTransform_
    OnBegin
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onbegin", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb

instance Deku.Attribute.Attr AnimateTransform_ OnBegin Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onbegin", value: _ } <<< Deku.Attribute.cb'

instance Deku.Attribute.Attr AnimateTransform_ OnBegin (Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onbegin", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb
    <<< const

instance
  Deku.Attribute.Attr Discard_
    OnBegin
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onbegin", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb

instance Deku.Attribute.Attr Discard_ OnBegin Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onbegin", value: _ } <<< Deku.Attribute.cb'

instance Deku.Attribute.Attr Discard_ OnBegin (Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onbegin", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb
    <<< const

instance
  Deku.Attribute.Attr Set_ OnBegin (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onbegin", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb

instance Deku.Attribute.Attr Set_ OnBegin Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onbegin", value: _ } <<< Deku.Attribute.cb'

instance Deku.Attribute.Attr Set_ OnBegin (Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onbegin", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb
    <<< const
