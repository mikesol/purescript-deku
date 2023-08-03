module Deku.DOM.Attr.OnClose where

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

data OnClose = OnClose

instance Attr anything OnClose (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnClose bothValues = unsafeAttribute $ Both (pure 
    { key: "close", value: cb' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "close", value: cb' value })
instance Attr anything OnClose (Product.Product (ST.ST Global.Global) Event.Event  Cb ) where
  attr OnClose (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "close", value: cb' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "close", value: cb' value })
instance Attr anything OnClose  Cb  where
  attr OnClose value = unsafeAttribute $ This $ pure $
    { key: "close", value: cb' value }
instance Attr anything OnClose (Event.Event  Cb ) where
  attr OnClose eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "close", value: cb' value }

instance Attr anything OnClose (ST.ST Global.Global  Cb ) where
  attr OnClose stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "close", value: cb' value }

instance Attr anything OnClose (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnClose bothValues = unsafeAttribute $ Both (pure 
    { key: "close", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "close", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnClose (Product.Product (ST.ST Global.Global) Event.Event  (Effect Unit) ) where
  attr OnClose (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "close", value: cb' (Cb (const ((value) $> true))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "close", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnClose  (Effect Unit)  where
  attr OnClose value = unsafeAttribute $ This $ pure $
    { key: "close", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnClose (Event.Event  (Effect Unit) ) where
  attr OnClose eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "close", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnClose (ST.ST Global.Global  (Effect Unit) ) where
  attr OnClose stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "close", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnClose (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnClose bothValues = unsafeAttribute $ Both (pure 
    { key: "close", value: cb' (Cb (const (NonEmpty.head bothValues))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "close", value: cb' (Cb (const value)) }
    )
instance Attr anything OnClose (Product.Product (ST.ST Global.Global) Event.Event  (Effect Boolean) ) where
  attr OnClose (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "close", value: cb' (Cb (const (value))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "close", value: cb' (Cb (const value)) }
    )
instance Attr anything OnClose  (Effect Boolean)  where
  attr OnClose value = unsafeAttribute $ This $ pure $
    { key: "close", value: cb' (Cb (const value)) }
instance Attr anything OnClose (Event.Event  (Effect Boolean) ) where
  attr OnClose eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "close", value: cb' (Cb (const value)) }

instance Attr anything OnClose (ST.ST Global.Global  (Effect Boolean) ) where
  attr OnClose stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "close", value: cb' (Cb (const value)) }

instance Attr everything OnClose (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnClose bothValues = unsafeAttribute $ Both (pure 
    { key: "close", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "close", value: unset' })
instance Attr everything OnClose (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr OnClose (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "close", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "close", value: unset' })
instance Attr everything OnClose  Unit  where
  attr OnClose _ = unsafeAttribute $ This $ pure $ { key: "close", value: unset' }
instance Attr everything OnClose (Event.Event  Unit ) where
  attr OnClose eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "close", value: unset' }

instance Attr everything OnClose (ST.ST Global.Global  Unit ) where
  attr OnClose stValue = unsafeAttribute $ This $ stValue <#> \_ ->
    { key: "close", value: unset' }
