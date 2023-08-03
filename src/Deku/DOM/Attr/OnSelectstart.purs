module Deku.DOM.Attr.OnSelectstart where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnSelectstart = OnSelectstart

instance Attr anything OnSelectstart (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnSelectstart bothValues = unsafeAttribute $ Both
    { key: "selectstart", value: cb' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "selectstart", value: cb' value })
instance Attr anything OnSelectstart  Cb  where
  attr OnSelectstart value = unsafeAttribute $ This $ pure $
    { key: "selectstart", value: cb' value }
instance Attr anything OnSelectstart (Event.Event  Cb ) where
  attr OnSelectstart eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "selectstart", value: cb' value }

instance Attr anything OnSelectstart (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnSelectstart bothValues = unsafeAttribute $ Both
    { key: "selectstart", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "selectstart", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnSelectstart  (Effect Unit)  where
  attr OnSelectstart value = unsafeAttribute $ This $ pure $
    { key: "selectstart", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnSelectstart (Event.Event  (Effect Unit) ) where
  attr OnSelectstart eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "selectstart", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnSelectstart (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnSelectstart bothValues = unsafeAttribute $ Both
    { key: "selectstart", value: cb' (Cb (const (NonEmpty.head bothValues))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "selectstart", value: cb' (Cb (const value)) }
    )
instance Attr anything OnSelectstart  (Effect Boolean)  where
  attr OnSelectstart value = unsafeAttribute $ This $ pure $
    { key: "selectstart", value: cb' (Cb (const value)) }
instance Attr anything OnSelectstart (Event.Event  (Effect Boolean) ) where
  attr OnSelectstart eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "selectstart", value: cb' (Cb (const value)) }

type OnSelectstartEffect =
  forall element
   . Attr element OnSelectstart (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnSelectstart (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnSelectstart bothValues = unsafeAttribute $ Both
    { key: "selectstart", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "selectstart", value: unset' })
instance Attr everything OnSelectstart  Unit  where
  attr OnSelectstart _ = unsafeAttribute $ This $ pure $
    { key: "selectstart", value: unset' }
instance Attr everything OnSelectstart (Event.Event  Unit ) where
  attr OnSelectstart eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "selectstart", value: unset' }
