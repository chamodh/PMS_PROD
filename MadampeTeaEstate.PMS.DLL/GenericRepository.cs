using System;
using System.Data.Entity;
using System.Linq;

namespace MadampeTeaEstate.PMS.DLL
{
    /// <summary>
    /// Generic Repository for retrieving data through the Entity framework 
    /// </summary>
    /// <typeparam name="C">This is the DB context</typeparam>
    /// <typeparam name="T">This is the Type of the generic class</typeparam>
    public abstract class GenericRepository<C, T>
        where T : class
        where C : DbContext, new()
    {
        private C entities = new C();
        public C Context
        {
            get { return entities; }
            set { entities = value; }
        }

        public virtual IQueryable<T> GetAll()
        {
            IQueryable<T> query = entities.Set<T>();
            return query;
        }

        public IQueryable<T> FindBy(System.Linq.Expressions.Expression<Func<T, bool>> predicate)
        {
            IQueryable<T> query = entities.Set<T>().Where(predicate);
            return query;
        }

        public virtual void EditInTransaction(T entity)
        {
            entities.Entry(entity).State = System.Data.Entity.EntityState.Modified;
        }

        public virtual void Add(T entity)
        {
            entities.Set<T>().Add(entity);
            Context.SaveChanges();
        }

        public virtual void Delete(T entity)
        {
            entities.Set<T>().Remove(entity);
            Context.SaveChanges();
        }

        public virtual void AddInTransaction(T entity)
        {
            entities.Set<T>().Add(entity);
        }

        public virtual void DeleteInTransaction(T entity)
        {
            entities.Set<T>().Add(entity);
        }
    }
}

