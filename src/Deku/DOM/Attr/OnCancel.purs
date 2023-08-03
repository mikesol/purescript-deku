module Deku.DOM.Attr.OnCancel where

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

data OnCancel = OnCancel

instance Attr anything OnCancel (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnCancel bothValues = unsafeAttribute $ Both (pure 
    { key: "cancel", value: cb' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "cancel", value: cb' value })
instance Attr anything OnCancel (Product.Product (ST.ST Global.Global) Event.Event  Cb ) where
  attr OnCancel (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "cancel", value: cb' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "cancel", value: cb' value })
instance Attr anything OnCancel  Cb  where
  attr OnCancel value = unsafeAttribute $ This $ pure $
    { key: "cancel", value: cb' value }
instance Attr anything OnCancel (Event.Event  Cb ) where
  attr OnCancel eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "cancel", value: cb' value }

instance Attr anything OnCancel (ST.ST Global.Global  Cb ) where
  attr OnCancel stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "cancel", value: cb' value }

instance Attr anything OnCancel (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnCancel bothValues = unsafeAttribute $ Both (pure 
    { key: "cancel", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "cancel", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnCancel (Product.Product (ST.ST Global.Global) Event.Event  (Effect Unit) ) where
  attr OnCancel (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "cancel", value: cb' (Cb (const ((value) $> true))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "cancel", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnCancel  (Effect Unit)  where
  attr OnCancel value = unsafeAttribute $ This $ pure $
    { key: "cancel", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnCancel (Event.Event  (Effect Unit) ) where
  attr OnCancel eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "cancel", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnCancel (ST.ST Global.Global  (Effect Unit) ) where
  attr OnCancel stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "cancel", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnCancel (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnCancel bothValues = unsafeAttribute $ Both (pure 
    { key: "cancel", value: cb' (Cb (const (NonEmpty.head bothValues))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "cancel", value: cb' (Cb (const value)) }
    )
instance Attr anything OnCancel (Product.Product (ST.ST Global.Global) Event.Event  (Effect Boolean) ) where
  attr OnCancel (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "cancel", value: cb' (Cb (const (value))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "cancel", value: cb' (Cb (const value)) }
    )
instance Attr anything OnCancel  (Effect Boolean)  where
  attr OnCancel value = unsafeAttribute $ This $ pure $
    { key: "cancel", value: cb' (Cb (const value)) }
instance Attr anything OnCancel (Event.Event  (Effect Boolean) ) where
  attr OnCancel eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "cancel", value: cb' (Cb (const value)) }

instance Attr anything OnCancel (ST.ST Global.Global  (Effect Boolean) ) where
  attr OnCancel stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "cancel", value: cb' (Cb (const value)) }

instance Attr everything OnCancel (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnCancel bothValues = unsafeAttribute $ Both (pure 
    { key: "cancel", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "cancel", value: unset' })
instance Attr everything OnCancel (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr OnCancel (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "cancel", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "cancel", value: unset' })
instance Attr everything OnCancel  Unit  where
  attr OnCancel _ = unsafeAttribute $ This $ pure $ { key: "cancel", value: unset' }
instance Attr everything OnCancel (Event.Event  Unit ) where
  attr OnCancel eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "cancel", value: unset' }

instance Attr everything OnCancel (ST.ST Global.Global  Unit ) where
  attr OnCancel stValue = unsafeAttribute $ This $ stValue <#> \_ ->
    { key: "cancel", value: unset' }
