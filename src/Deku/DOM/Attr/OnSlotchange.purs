module Deku.DOM.Attr.OnSlotchange where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')

data OnSlotchange = OnSlotchange

instance Attr anything OnSlotchange (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnSlotchange bothValues = unsafeAttribute $ Both (pure 
    { key: "slotchange", value: cb' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slotchange", value: cb' value })
instance Attr anything OnSlotchange (Product.Product (ST.ST Global.Global) Event.Event  Cb ) where
  attr OnSlotchange (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slotchange", value: cb' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slotchange", value: cb' value })
instance Attr anything OnSlotchange  Cb  where
  attr OnSlotchange value = unsafeAttribute $ This $ pure $
    { key: "slotchange", value: cb' value }
instance Attr anything OnSlotchange (Event.Event  Cb ) where
  attr OnSlotchange eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "slotchange", value: cb' value }

instance Attr anything OnSlotchange (ST.ST Global.Global  Cb ) where
  attr OnSlotchange stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "slotchange", value: cb' value }

instance Attr anything OnSlotchange (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnSlotchange bothValues = unsafeAttribute $ Both (pure 
    { key: "slotchange", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "slotchange", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnSlotchange (Product.Product (ST.ST Global.Global) Event.Event  (Effect Unit) ) where
  attr OnSlotchange (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slotchange", value: cb' (Cb (const ((value) $> true))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "slotchange", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnSlotchange  (Effect Unit)  where
  attr OnSlotchange value = unsafeAttribute $ This $ pure $
    { key: "slotchange", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnSlotchange (Event.Event  (Effect Unit) ) where
  attr OnSlotchange eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "slotchange", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnSlotchange (ST.ST Global.Global  (Effect Unit) ) where
  attr OnSlotchange stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "slotchange", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnSlotchange (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnSlotchange bothValues = unsafeAttribute $ Both (pure 
    { key: "slotchange", value: cb' (Cb (const (NonEmpty.head bothValues))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "slotchange", value: cb' (Cb (const value)) }
    )
instance Attr anything OnSlotchange (Product.Product (ST.ST Global.Global) Event.Event  (Effect Boolean) ) where
  attr OnSlotchange (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slotchange", value: cb' (Cb (const (value))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "slotchange", value: cb' (Cb (const value)) }
    )
instance Attr anything OnSlotchange  (Effect Boolean)  where
  attr OnSlotchange value = unsafeAttribute $ This $ pure $
    { key: "slotchange", value: cb' (Cb (const value)) }
instance Attr anything OnSlotchange (Event.Event  (Effect Boolean) ) where
  attr OnSlotchange eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "slotchange", value: cb' (Cb (const value)) }

instance Attr anything OnSlotchange (ST.ST Global.Global  (Effect Boolean) ) where
  attr OnSlotchange stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "slotchange", value: cb' (Cb (const value)) }

instance Attr everything OnSlotchange (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnSlotchange bothValues = unsafeAttribute $ Both (pure 
    { key: "slotchange", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "slotchange", value: unset' })
instance Attr everything OnSlotchange (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr OnSlotchange (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "slotchange", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "slotchange", value: unset' })
instance Attr everything OnSlotchange  Unit  where
  attr OnSlotchange _ = unsafeAttribute $ This $ pure $
    { key: "slotchange", value: unset' }
instance Attr everything OnSlotchange (Event.Event  Unit ) where
  attr OnSlotchange eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "slotchange", value: unset' }

instance Attr everything OnSlotchange (ST.ST Global.Global  Unit ) where
  attr OnSlotchange stValue = unsafeAttribute $ This $ stValue <#>
    \_ -> { key: "slotchange", value: unset' }
