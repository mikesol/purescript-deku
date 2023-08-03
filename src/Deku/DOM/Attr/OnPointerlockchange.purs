module Deku.DOM.Attr.OnPointerlockchange where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnPointerlockchange = OnPointerlockchange

instance Attr anything OnPointerlockchange (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnPointerlockchange bothValues = unsafeAttribute $ Both
    { key: "pointerlockchange", value: cb' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "pointerlockchange", value: cb' value }
    )
instance Attr anything OnPointerlockchange  Cb  where
  attr OnPointerlockchange value = unsafeAttribute $ This $ pure $
    { key: "pointerlockchange", value: cb' value }
instance Attr anything OnPointerlockchange (Event.Event  Cb ) where
  attr OnPointerlockchange eventValue = unsafeAttribute $ That $
    eventValue <#> \value -> { key: "pointerlockchange", value: cb' value }

instance Attr anything OnPointerlockchange (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnPointerlockchange bothValues = unsafeAttribute $ Both
    { key: "pointerlockchange"
    , value: cb' (Cb (const ((NonEmpty.head bothValues) $> true)))
    }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "pointerlockchange", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnPointerlockchange  (Effect Unit)  where
  attr OnPointerlockchange value = unsafeAttribute $ This $ pure $
    { key: "pointerlockchange", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnPointerlockchange (Event.Event  (Effect Unit) ) where
  attr OnPointerlockchange eventValue = unsafeAttribute $ That $
    eventValue <#> \value ->
      { key: "pointerlockchange", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnPointerlockchange (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnPointerlockchange bothValues = unsafeAttribute $ Both
    { key: "pointerlockchange", value: cb' (Cb (const (NonEmpty.head bothValues))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "pointerlockchange", value: cb' (Cb (const value)) }
    )
instance Attr anything OnPointerlockchange  (Effect Boolean)  where
  attr OnPointerlockchange value = unsafeAttribute $ This $ pure $
    { key: "pointerlockchange", value: cb' (Cb (const value)) }
instance Attr anything OnPointerlockchange (Event.Event  (Effect Boolean) ) where
  attr OnPointerlockchange eventValue = unsafeAttribute $ That $
    eventValue <#> \value ->
      { key: "pointerlockchange", value: cb' (Cb (const value)) }

type OnPointerlockchangeEffect =
  forall element
   . Attr element OnPointerlockchange (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnPointerlockchange (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnPointerlockchange bothValues = unsafeAttribute $ Both
    { key: "pointerlockchange", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "pointerlockchange", value: unset' })
instance Attr everything OnPointerlockchange  Unit  where
  attr OnPointerlockchange _ = unsafeAttribute $ This $ pure $
    { key: "pointerlockchange", value: unset' }
instance Attr everything OnPointerlockchange (Event.Event  Unit ) where
  attr OnPointerlockchange eventValue = unsafeAttribute $ That $
    eventValue <#> \_ -> { key: "pointerlockchange", value: unset' }
