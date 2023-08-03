module Deku.DOM.Attr.OnEmptied where

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

data OnEmptied = OnEmptied

instance Attr anything OnEmptied (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnEmptied bothValues = unsafeAttribute $ Both (pure 
    { key: "emptied", value: cb' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "emptied", value: cb' value })
instance Attr anything OnEmptied (Product.Product (ST.ST Global.Global) Event.Event  Cb ) where
  attr OnEmptied (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "emptied", value: cb' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "emptied", value: cb' value })
instance Attr anything OnEmptied  Cb  where
  attr OnEmptied value = unsafeAttribute $ This $ pure $
    { key: "emptied", value: cb' value }
instance Attr anything OnEmptied (Event.Event  Cb ) where
  attr OnEmptied eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "emptied", value: cb' value }

instance Attr anything OnEmptied (ST.ST Global.Global  Cb ) where
  attr OnEmptied stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "emptied", value: cb' value }

instance Attr anything OnEmptied (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnEmptied bothValues = unsafeAttribute $ Both (pure 
    { key: "emptied", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "emptied", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnEmptied (Product.Product (ST.ST Global.Global) Event.Event  (Effect Unit) ) where
  attr OnEmptied (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "emptied", value: cb' (Cb (const ((value) $> true))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "emptied", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnEmptied  (Effect Unit)  where
  attr OnEmptied value = unsafeAttribute $ This $ pure $
    { key: "emptied", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnEmptied (Event.Event  (Effect Unit) ) where
  attr OnEmptied eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "emptied", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnEmptied (ST.ST Global.Global  (Effect Unit) ) where
  attr OnEmptied stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "emptied", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnEmptied (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnEmptied bothValues = unsafeAttribute $ Both (pure 
    { key: "emptied", value: cb' (Cb (const (NonEmpty.head bothValues))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "emptied", value: cb' (Cb (const value)) }
    )
instance Attr anything OnEmptied (Product.Product (ST.ST Global.Global) Event.Event  (Effect Boolean) ) where
  attr OnEmptied (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "emptied", value: cb' (Cb (const (value))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "emptied", value: cb' (Cb (const value)) }
    )
instance Attr anything OnEmptied  (Effect Boolean)  where
  attr OnEmptied value = unsafeAttribute $ This $ pure $
    { key: "emptied", value: cb' (Cb (const value)) }
instance Attr anything OnEmptied (Event.Event  (Effect Boolean) ) where
  attr OnEmptied eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "emptied", value: cb' (Cb (const value)) }

instance Attr anything OnEmptied (ST.ST Global.Global  (Effect Boolean) ) where
  attr OnEmptied stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "emptied", value: cb' (Cb (const value)) }

instance Attr everything OnEmptied (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnEmptied bothValues = unsafeAttribute $ Both (pure 
    { key: "emptied", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "emptied", value: unset' })
instance Attr everything OnEmptied (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr OnEmptied (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "emptied", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "emptied", value: unset' })
instance Attr everything OnEmptied  Unit  where
  attr OnEmptied _ = unsafeAttribute $ This $ pure $
    { key: "emptied", value: unset' }
instance Attr everything OnEmptied (Event.Event  Unit ) where
  attr OnEmptied eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "emptied", value: unset' }

instance Attr everything OnEmptied (ST.ST Global.Global  Unit ) where
  attr OnEmptied stValue = unsafeAttribute $ This $ stValue <#>
    \_ -> { key: "emptied", value: unset' }
