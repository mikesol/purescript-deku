module Deku.DOM.Attr.OnEmptied where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnEmptied = OnEmptied

instance Attr anything OnEmptied (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnEmptied bothValues = unsafeAttribute $ Both
    { key: "emptied", value: cb' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "emptied", value: cb' value })
instance Attr anything OnEmptied  Cb  where
  attr OnEmptied value = unsafeAttribute $ This $ pure $
    { key: "emptied", value: cb' value }
instance Attr anything OnEmptied (Event.Event  Cb ) where
  attr OnEmptied eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "emptied", value: cb' value }

instance Attr anything OnEmptied (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnEmptied bothValues = unsafeAttribute $ Both
    { key: "emptied", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "emptied", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnEmptied  (Effect Unit)  where
  attr OnEmptied value = unsafeAttribute $ This $ pure $
    { key: "emptied", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnEmptied (Event.Event  (Effect Unit) ) where
  attr OnEmptied eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "emptied", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnEmptied (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnEmptied bothValues = unsafeAttribute $ Both
    { key: "emptied", value: cb' (Cb (const (NonEmpty.head bothValues))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "emptied", value: cb' (Cb (const value)) }
    )
instance Attr anything OnEmptied  (Effect Boolean)  where
  attr OnEmptied value = unsafeAttribute $ This $ pure $
    { key: "emptied", value: cb' (Cb (const value)) }
instance Attr anything OnEmptied (Event.Event  (Effect Boolean) ) where
  attr OnEmptied eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "emptied", value: cb' (Cb (const value)) }

type OnEmptiedEffect =
  forall element
   . Attr element OnEmptied (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnEmptied (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnEmptied bothValues = unsafeAttribute $ Both
    { key: "emptied", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "emptied", value: unset' })
instance Attr everything OnEmptied  Unit  where
  attr OnEmptied _ = unsafeAttribute $ This $ pure $
    { key: "emptied", value: unset' }
instance Attr everything OnEmptied (Event.Event  Unit ) where
  attr OnEmptied eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "emptied", value: unset' }
